; DESCRIPTION: Renders a cyan line between points (268, 97) and (48, 228).
; PLAN: r0=268(x1), r1=97(y1), r2=48(x2), r3=228(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 97
LDI r2, 48
LDI r3, 228
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
