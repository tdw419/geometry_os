; DESCRIPTION: Renders a cyan box of size 34x90 starting at (109, 125).
; PLAN: r0=109(x), r1=125(y), r2=34(width), r3=90(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 125
LDI r2, 34
LDI r3, 90
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
