; DESCRIPTION: Renders a cyan box of size 67x85 starting at (39, 164).
; PLAN: r0=39(x), r1=164(y), r2=67(width), r3=85(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 164
LDI r2, 67
LDI r3, 85
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
