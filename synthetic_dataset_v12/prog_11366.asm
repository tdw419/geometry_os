; DESCRIPTION: Renders a cyan box of size 67x113 starting at (202, 113).
; PLAN: r0=202(x), r1=113(y), r2=67(width), r3=113(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 113
LDI r2, 67
LDI r3, 113
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
