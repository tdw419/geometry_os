; DESCRIPTION: Renders a cyan box of size 57x71 starting at (103, 132).
; PLAN: r0=103(x), r1=132(y), r2=57(width), r3=71(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 132
LDI r2, 57
LDI r3, 71
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
