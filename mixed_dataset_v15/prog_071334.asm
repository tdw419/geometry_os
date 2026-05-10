; DESCRIPTION: Composite: Renders a orange box of size 19x42 starting at (78, 213) then Places a magenta line segment connecting (228, 204) to (404, 158).
; PLAN: r0=78(x), r1=213(y), r2=19(width), r3=42(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=228(x1), r6=204(y1), r7=404(x2), r8=158(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 78
LDI r1, 213
LDI r2, 19
LDI r3, 42
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 228
LDI r6, 204
LDI r7, 404
LDI r8, 158
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
