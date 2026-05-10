; DESCRIPTION: Renders a cyan box of size 54x67 starting at (370, 8).
; PLAN: r0=370(x), r1=8(y), r2=54(width), r3=67(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 8
LDI r2, 54
LDI r3, 67
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
