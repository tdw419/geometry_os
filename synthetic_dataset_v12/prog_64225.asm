; DESCRIPTION: Renders a cyan box of size 91x79 starting at (368, 113).
; PLAN: r0=368(x), r1=113(y), r2=91(width), r3=79(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 113
LDI r2, 91
LDI r3, 79
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
