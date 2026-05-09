; DESCRIPTION: Composite: Places a orange dot at position (482, 164) then Renders a orange box of size 32x36 starting at (227, 103).
; PLAN: r0=482(x), r1=164(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=227(x), r6=103(y), r7=32(width), r8=36(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 482
LDI r1, 164
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 227
LDI r6, 103
LDI r7, 32
LDI r8, 36
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
