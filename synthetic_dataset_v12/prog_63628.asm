; DESCRIPTION: Renders a purple line between points (433, 228) and (126, 213).
; PLAN: r0=433(x1), r1=228(y1), r2=126(x2), r3=213(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 228
LDI r2, 126
LDI r3, 213
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
