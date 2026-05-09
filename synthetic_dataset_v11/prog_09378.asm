; DESCRIPTION: Places a cyan 55x43 rectangle at position (169, 139).
; PLAN: r0=169(x), r1=139(y), r2=55(width), r3=43(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 139
LDI r2, 55
LDI r3, 43
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
