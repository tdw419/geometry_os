; DESCRIPTION: Renders a cyan line between points (352, 226) and (340, 117).
; PLAN: r0=352(x1), r1=226(y1), r2=340(x2), r3=117(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 226
LDI r2, 340
LDI r3, 117
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
