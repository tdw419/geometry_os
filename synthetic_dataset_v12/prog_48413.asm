; DESCRIPTION: Renders a cyan box of size 57x38 starting at (275, 140).
; PLAN: r0=275(x), r1=140(y), r2=57(width), r3=38(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 140
LDI r2, 57
LDI r3, 38
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
