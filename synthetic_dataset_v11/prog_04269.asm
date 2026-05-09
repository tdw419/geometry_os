; DESCRIPTION: Renders a cyan box of size 69x59 starting at (82, 159).
; PLAN: r0=82(x), r1=159(y), r2=69(width), r3=59(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 159
LDI r2, 69
LDI r3, 59
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
