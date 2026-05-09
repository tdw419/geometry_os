; DESCRIPTION: Renders a orange box of size 94x39 starting at (94, 177).
; PLAN: r0=94(x), r1=177(y), r2=94(width), r3=39(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 177
LDI r2, 94
LDI r3, 39
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
