; DESCRIPTION: Renders a magenta line between points (182, 215) and (167, 113).
; PLAN: r0=182(x1), r1=215(y1), r2=167(x2), r3=113(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 215
LDI r2, 167
LDI r3, 113
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
