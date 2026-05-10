; DESCRIPTION: Places a yellow 55x55 box at position (179, 161).
; PLAN: r0=179(x), r1=161(y), r2=55(width), r3=55(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 161
LDI r2, 55
LDI r3, 55
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
