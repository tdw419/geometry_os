; DESCRIPTION: Composite: Places a red line segment connecting (397, 228) to (214, 238) then Places a white dot at position (271, 14).
; PLAN: r0=397(x1), r1=228(y1), r2=214(x2), r3=238(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=271(x), r6=14(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 397
LDI r1, 228
LDI r2, 214
LDI r3, 238
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 271
LDI r6, 14
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
