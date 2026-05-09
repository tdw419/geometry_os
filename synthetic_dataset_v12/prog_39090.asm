; DESCRIPTION: Composite: Places a magenta dot at position (433, 210) then Renders a orange box of size 97x111 starting at (149, 47).
; PLAN: r0=433(x), r1=210(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=149(x), r6=47(y), r7=97(width), r8=111(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 433
LDI r1, 210
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 149
LDI r6, 47
LDI r7, 97
LDI r8, 111
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
