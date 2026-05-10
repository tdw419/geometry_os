; DESCRIPTION: Places a cyan 65x94 rectangle at position (369, 52).
; PLAN: r0=369(x), r1=52(y), r2=65(width), r3=94(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 52
LDI r2, 65
LDI r3, 94
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
