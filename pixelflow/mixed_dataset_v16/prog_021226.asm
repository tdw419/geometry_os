; DESCRIPTION: Composite: Sets a single red pixel at (500, 146) then Places a purple line segment connecting (384, 254) to (401, 172).
; PLAN: r0=500(x), r1=146(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=384(x1), r6=254(y1), r7=401(x2), r8=172(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 500
LDI r1, 146
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 384
LDI r6, 254
LDI r7, 401
LDI r8, 172
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
