; DESCRIPTION: Renders a cyan box of size 69x50 starting at (102, 8).
; PLAN: r0=102(x), r1=8(y), r2=69(width), r3=50(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 8
LDI r2, 69
LDI r3, 50
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
