; DESCRIPTION: Composite: . Then Renders a orange box of size 67x39 starting at (137, 209). Then Sets a single orange pixel at (95, 111).
; PLAN: r0=137(x), r1=209(y), r2=67(width), r3=39(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=95(x), r1=111(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a orange box of size 67x39 starting at (137, 209).
; PLAN: r0=137(x), r1=209(y), r2=67(width), r3=39(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 209
LDI r2, 67
LDI r3, 39
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single orange pixel at (95, 111).
; PLAN: r0=95(x), r1=111(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 95
LDI r1, 111
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
