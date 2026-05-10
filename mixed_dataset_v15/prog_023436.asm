; DESCRIPTION: Composite: Places a cyan line segment connecting (401, 20) to (207, 111) then Places a yellow dot at position (284, 10).
; PLAN: r0=401(x1), r1=20(y1), r2=207(x2), r3=111(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=284(x), r6=10(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 401
LDI r1, 20
LDI r2, 207
LDI r3, 111
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 284
LDI r6, 10
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
