; DESCRIPTION: Places a magenta line segment connecting (241, 204) to (401, 111).
; PLAN: r0=241(x1), r1=204(y1), r2=401(x2), r3=111(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 204
LDI r2, 401
LDI r3, 111
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
