; DESCRIPTION: Renders a cyan box of size 51x68 starting at (276, 171).
; PLAN: r0=276(x), r1=171(y), r2=51(width), r3=68(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 171
LDI r2, 51
LDI r3, 68
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
