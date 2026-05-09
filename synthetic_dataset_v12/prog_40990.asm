; DESCRIPTION: Creates a black rectangular region at (404, 120) spanning 79 by 20 pixels.
; PLAN: r0=404(x), r1=120(y), r2=79(width), r3=20(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 120
LDI r2, 79
LDI r3, 20
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
