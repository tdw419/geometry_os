; DESCRIPTION: Composite: Renders a orange box of size 67x52 starting at (235, 168) then Places a blue dot at position (67, 150).
; PLAN: r0=235(x), r1=168(y), r2=67(width), r3=52(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=67(x), r6=150(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 235
LDI r1, 168
LDI r2, 67
LDI r3, 52
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 67
LDI r6, 150
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
