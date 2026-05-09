; DESCRIPTION: Renders a cyan box of size 28x26 starting at (215, 166).
; PLAN: r0=215(x), r1=166(y), r2=28(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 166
LDI r2, 28
LDI r3, 26
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
