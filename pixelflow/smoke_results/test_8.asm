; DESCRIPTION : Draw s a check er b o ar d p at ter n of 8 x 8 square s us ing bl a ck and w hit e . It w ri t es to the screen , the n e nt ers a s er i es of loop w h er e it re p e ated ly checks if the p res se d to p - right co r ne r d by o th er counter . The pro v id es o th er w i se , it di sp lay s the text " H E L LO " and " W OR L D " on the screen at a sp e ci fi c position , updates the f ra me , and the n re p e at s .

; input d ri ve n pro g ra m
; initi ali z ation
LDI r2, 256
LDI r9, 255
main_0:
LDI r10, 3526
LDI r14, 0x158ED0
LDI r6, 0x319329
TEXT r10, r14, r6, "HELLO"
LDI r14, 74
LDI r2, 3560
LDI r1, 64
WPIXEL
LDI r10, 10
LDI r12, 0xE72C0C
LDI r12, 0xC35BF7
TEXT r10, r12