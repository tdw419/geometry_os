; DESCRIPTION: Draws a cyan line from (254, 209) to (87, 122).
; PLAN: r0=254(x1), r1=209(y1), r2=87(x2), r3=122(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 209
LDI r2, 87
LDI r3, 122
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
