; DESCRIPTION: Renders a cyan line between points (434, 52) and (198, 213).
; PLAN: r0=434(x1), r1=52(y1), r2=198(x2), r3=213(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 52
LDI r2, 198
LDI r3, 213
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
