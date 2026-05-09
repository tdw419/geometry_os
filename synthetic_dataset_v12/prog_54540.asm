; DESCRIPTION: Renders a cyan box of size 107x55 starting at (266, 171).
; PLAN: r0=266(x), r1=171(y), r2=107(width), r3=55(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 171
LDI r2, 107
LDI r3, 55
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
