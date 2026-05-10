; DESCRIPTION: Renders a cyan box of size 111x23 starting at (275, 164).
; PLAN: r0=275(x), r1=164(y), r2=111(width), r3=23(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 164
LDI r2, 111
LDI r3, 23
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
