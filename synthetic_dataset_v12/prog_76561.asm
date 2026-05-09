; DESCRIPTION: Renders a magenta line between points (401, 228) and (342, 210).
; PLAN: r0=401(x1), r1=228(y1), r2=342(x2), r3=210(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 228
LDI r2, 342
LDI r3, 210
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
