; DESCRIPTION: Renders a white line between points (340, 27) and (228, 38).
; PLAN: r0=340(x1), r1=27(y1), r2=228(x2), r3=38(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 27
LDI r2, 228
LDI r3, 38
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
