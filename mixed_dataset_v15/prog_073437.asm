; DESCRIPTION: Renders a cyan box of size 113x105 starting at (148, 50).
; PLAN: r0=148(x), r1=50(y), r2=113(width), r3=105(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 50
LDI r2, 113
LDI r3, 105
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
