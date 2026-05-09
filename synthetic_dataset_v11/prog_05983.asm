; DESCRIPTION: Composite: . Then Creates a white rectangular region at (100, 54) spanning 80 by 38 pixels. Then Places a red dot at position (228, 111).
; PLAN: r0=100(x), r1=54(y), r2=80(width), r3=38(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=228(x), r1=111(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a white rectangular region at (100, 54) spanning 80 by 38 pixels.
; PLAN: r0=100(x), r1=54(y), r2=80(width), r3=38(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 54
LDI r2, 80
LDI r3, 38
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a red dot at position (228, 111).
; PLAN: r0=228(x), r1=111(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 228
LDI r1, 111
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
