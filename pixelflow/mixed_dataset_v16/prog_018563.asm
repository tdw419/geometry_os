; DESCRIPTION: Composite: Places a cyan line segment connecting (487, 157) to (214, 64) then Places a magenta dot at position (358, 145).
; PLAN: r0=487(x1), r1=157(y1), r2=214(x2), r3=64(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=358(x), r6=145(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 487
LDI r1, 157
LDI r2, 214
LDI r3, 64
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 358
LDI r6, 145
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
