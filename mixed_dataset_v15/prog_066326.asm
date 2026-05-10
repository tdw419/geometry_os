; DESCRIPTION: Renders a cyan box of size 113x115 starting at (329, 39).
; PLAN: r0=329(x), r1=39(y), r2=113(width), r3=115(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 39
LDI r2, 113
LDI r3, 115
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
