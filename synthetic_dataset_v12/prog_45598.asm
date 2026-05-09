; DESCRIPTION: Creates a white rectangular region at (434, 169) spanning 38 by 50 pixels.
; PLAN: r0=434(x), r1=169(y), r2=38(width), r3=50(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 169
LDI r2, 38
LDI r3, 50
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
