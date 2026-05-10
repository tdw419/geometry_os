; DESCRIPTION: Renders a magenta line between points (405, 246) and (401, 167).
; PLAN: r0=405(x1), r1=246(y1), r2=401(x2), r3=167(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 246
LDI r2, 401
LDI r3, 167
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
