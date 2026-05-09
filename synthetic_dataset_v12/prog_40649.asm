; DESCRIPTION: Renders a orange box of size 92x111 starting at (391, 91).
; PLAN: r0=391(x), r1=91(y), r2=92(width), r3=111(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 91
LDI r2, 92
LDI r3, 111
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
