; DESCRIPTION: Composite: Creates a blue rectangular region at (272, 50) spanning 76 by 100 pixels then Sets a single red pixel at (404, 212).
; PLAN: r0=272(x), r1=50(y), r2=76(width), r3=100(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=404(x), r6=212(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 272
LDI r1, 50
LDI r2, 76
LDI r3, 100
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 404
LDI r6, 212
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
