; DESCRIPTION: Renders a cyan box of size 113x99 starting at (215, 30).
; PLAN: r0=215(x), r1=30(y), r2=113(width), r3=99(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 30
LDI r2, 113
LDI r3, 99
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
