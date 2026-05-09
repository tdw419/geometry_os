; DESCRIPTION: Draws a white line from (298, 63) to (128, 166).
; PLAN: r0=298(x1), r1=63(y1), r2=128(x2), r3=166(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 63
LDI r2, 128
LDI r3, 166
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
