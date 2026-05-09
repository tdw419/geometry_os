; DESCRIPTION: Places a yellow 79x56 rectangle at position (295, 139).
; PLAN: r0=295(x), r1=139(y), r2=79(width), r3=56(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 139
LDI r2, 79
LDI r3, 56
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
