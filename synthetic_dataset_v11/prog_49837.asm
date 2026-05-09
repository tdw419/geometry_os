; DESCRIPTION: Draws a cyan line from (239, 8) to (43, 166).
; PLAN: r0=239(x1), r1=8(y1), r2=43(x2), r3=166(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 8
LDI r2, 43
LDI r3, 166
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
