; DESCRIPTION: Draws a white line from (398, 113) to (363, 228).
; PLAN: r0=398(x1), r1=113(y1), r2=363(x2), r3=228(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 113
LDI r2, 363
LDI r3, 228
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
