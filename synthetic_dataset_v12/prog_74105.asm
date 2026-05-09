; DESCRIPTION: Composite: Sets a single green pixel at (299, 5) then Draws a cyan line from (397, 168) to (113, 143).
; PLAN: r0=299(x), r1=5(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=397(x1), r6=168(y1), r7=113(x2), r8=143(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 299
LDI r1, 5
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 397
LDI r6, 168
LDI r7, 113
LDI r8, 143
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
