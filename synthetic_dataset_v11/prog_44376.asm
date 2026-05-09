; DESCRIPTION: Places a cyan 35x76 rectangle at position (1, 169).
; PLAN: r0=1(x), r1=169(y), r2=35(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 169
LDI r2, 35
LDI r3, 76
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
