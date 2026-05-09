; DESCRIPTION: Renders a cyan box of size 67x107 starting at (422, 21).
; PLAN: r0=422(x), r1=21(y), r2=67(width), r3=107(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 21
LDI r2, 67
LDI r3, 107
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
