; DESCRIPTION: Composite: Places a red dot at position (464, 123) then Renders a orange box of size 61x50 starting at (71, 54).
; PLAN: r0=464(x), r1=123(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=71(x), r6=54(y), r7=61(width), r8=50(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 464
LDI r1, 123
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 71
LDI r6, 54
LDI r7, 61
LDI r8, 50
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
