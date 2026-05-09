; DESCRIPTION: Composite: Places a magenta dot at position (330, 205) then Renders a orange box of size 83x87 starting at (404, 60).
; PLAN: r0=330(x), r1=205(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=404(x), r6=60(y), r7=83(width), r8=87(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 330
LDI r1, 205
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 404
LDI r6, 60
LDI r7, 83
LDI r8, 87
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
