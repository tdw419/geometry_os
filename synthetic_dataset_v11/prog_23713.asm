; DESCRIPTION: Renders a cyan box of size 103x61 starting at (145, 132).
; PLAN: r0=145(x), r1=132(y), r2=103(width), r3=61(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 132
LDI r2, 103
LDI r3, 61
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
