; DESCRIPTION: Renders a cyan box of size 20x113 starting at (160, 133).
; PLAN: r0=160(x), r1=133(y), r2=20(width), r3=113(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 133
LDI r2, 20
LDI r3, 113
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
