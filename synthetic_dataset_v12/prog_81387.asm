; DESCRIPTION: Composite: Renders a purple box of size 120x117 starting at (284, 100) then Sets a single magenta pixel at (173, 111).
; PLAN: r0=284(x), r1=100(y), r2=120(width), r3=117(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=173(x), r6=111(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 284
LDI r1, 100
LDI r2, 120
LDI r3, 117
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 173
LDI r6, 111
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
