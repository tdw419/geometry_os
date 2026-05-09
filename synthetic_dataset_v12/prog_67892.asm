; DESCRIPTION: Renders a cyan box of size 36x113 starting at (280, 45).
; PLAN: r0=280(x), r1=45(y), r2=36(width), r3=113(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 45
LDI r2, 36
LDI r3, 113
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
